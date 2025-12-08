import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input", "area"];

  connect() {
    this.element.addEventListener("dragover", this.preventDefaults);
    this.element.addEventListener("dragleave", this.preventDefaults);
    this.element.addEventListener("drop", this.preventDefaults);
  }

  preventDefaults(e) {
    e.preventDefault();
    e.stopPropagation();
  }

  dragOver(e) {
    this.areaTarget.classList.add(
      "border-indigo-500",
      "bg-indigo-50",
      "shadow-inner",
      "scale-[1.01]"
    );
    this.areaTarget.classList.remove("border-slate-300", "bg-white");
    this.areaTarget.querySelector(".icon-bg").classList.replace("bg-slate-100", "bg-indigo-100");
    this.areaTarget
      .querySelector(".icon-bg")
      .classList.replace("text-slate-400", "text-indigo-600");
    this.areaTarget.querySelector(".drag-text").textContent = "Drop files now";
  }

  dragLeave(e) {
    this.resetStyles();
  }

  drop(e) {
    this.resetStyles();
    if (e.dataTransfer.files.length > 0) {
      this.inputTarget.files = e.dataTransfer.files;
      this.upload();
    }
  }

  resetStyles() {
    this.areaTarget.classList.remove(
      "border-indigo-500",
      "bg-indigo-50",
      "shadow-inner",
      "scale-[1.01]"
    );
    this.areaTarget.classList.add("border-slate-300", "bg-white");
    this.areaTarget.querySelector(".icon-bg").classList.replace("bg-indigo-100", "bg-slate-100");
    this.areaTarget
      .querySelector(".icon-bg")
      .classList.replace("text-indigo-600", "text-slate-400");
    this.areaTarget.querySelector(".drag-text").textContent = "Drag & Drop files here";
  }

  triggerInput() {
    this.inputTarget.click();
  }

  upload() {
    this.element.requestSubmit();
  }
}
