import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "item", "count", "empty"];

  filter() {
    const term = this.inputTarget.value.toLowerCase();
    let visibleCount = 0;

    this.itemTargets.forEach((item) => {
      const name = item.dataset.name.toLowerCase();
      if (name.includes(term)) {
        item.classList.remove("hidden");
        visibleCount++;
      } else {
        item.classList.add("hidden");
      }
    });

    this.updateCount(visibleCount);
    this.toggleEmptyState(visibleCount);
  }

  updateCount(count) {
    if (this.hasCountTarget) {
      this.countTarget.textContent = `${count} files`;
    }
  }

  toggleEmptyState(count) {
    if (this.hasEmptyTarget) {
      if (count === 0) {
        this.emptyTarget.classList.remove("hidden");
      } else {
        this.emptyTarget.classList.add("hidden");
      }
    }
  }
}
