import { Controller } from "@hotwired/stimulus";
import jStat from "jstat";

// Connects to data-controller="drop-rate"
export default class extends Controller {
  static targets = [
    "dropChance",
    "bossKills",
    "result",
    "killsPerDrop",
    "numberOfDrops",
  ];
  static values = { id: Number };
  connect() {
    console.log("Hello, Stimulus!", this.element);
    this.calculateReceivedProbability();
  }

  convertToPercentage() {
    const killsPerDrop = parseFloat(this.killsPerDropTarget.value);
    if (killsPerDrop <= 0) {
      this.dropChanceTarget.value = 0;
    } else {
      this.dropChanceTarget.value = (1 / killsPerDrop).toFixed(6);
    }
    this.calculateReceivedProbability();
  }

  convertToKillsPerDrop() {
    const dropChance = parseFloat(this.dropChanceTarget.value);
    if (dropChance <= 0) {
      this.killsPerDropTarget.value = 0;
    } else {
      this.killsPerDropTarget.value = (1 / dropChance).toFixed(0);
    }
    this.calculateReceivedProbability();
  }

  calculateReceivedProbability() {
    const dropChance = parseFloat(this.dropChanceTarget.value);
    const bossKills = parseInt(this.bossKillsTarget.value);
    const numberOfDrops = parseInt(this.numberOfDropsTarget.value);

    if (dropChance <= 0 || bossKills < 0 || numberOfDrops < 0) {
      this.updateResultText(0, 0, 0);
      return;
    }
    const cdfLessThanM = jStat.binomial.cdf(
        numberOfDrops - 1,
        bossKills,
        dropChance
    );
    const probabilityExactly = jStat.binomial.pdf(
        numberOfDrops,
        bossKills,
        dropChance
    );
    const probabilityAtLeast = 1 - cdfLessThanM;
    const probabilityLessThan = cdfLessThanM;

    this.updateResultText(
        probabilityAtLeast,
        probabilityExactly,
        probabilityLessThan
    );
  }

  updateResultText(atLeast, exactly, lessThan) {
    const numberOfDrops = parseInt(this.numberOfDropsTarget.value);
    const dropText = numberOfDrops === 1 ? "drop" : "drops";

    this.resultTarget.innerHTML = `
      <p>You have a <strong>${(atLeast * 100).toFixed(
        2
    )}%</strong> chance of getting at least ${numberOfDrops} ${dropText}</p>
      <p>You have a <strong>${(exactly * 100).toFixed(
        2
    )}%</strong> chance of getting exactly ${numberOfDrops} ${dropText}</p>
      <p>You have a <strong>${(lessThan * 100).toFixed(
        2
    )}%</strong> chance of getting less than ${numberOfDrops} ${dropText}</p>`;
  }

  submitFormOnChange() {
    if (this.idValue) {
      this.element.requestSubmit();
    }
  }
}
