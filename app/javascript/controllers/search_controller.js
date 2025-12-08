import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "item"];

  filter() {
    const term = this.inputTarget.value.toLowerCase();

    this.itemTargets.forEach((item) => {
      const name = item.dataset.name.toLowerCase();
      if (name.includes(term)) {
        item.classList.remove("hidden");
      } else {
        item.classList.add("hidden");
      }
    });
  }
}
