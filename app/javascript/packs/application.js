import { Turbo } from "@hotwired/turbo-rails";
Turbo.start();

document.addEventListener("DOMContentLoaded", () => {
  const initialMessage = document.querySelector('.initial-message');
  const choicesSection = document.querySelector('.choices');

  if (initialMessage) {
    setTimeout(() => {
      initialMessage.style.display = 'none';
      if (choicesSection) {
        choicesSection.style.display = 'flex';
      }
    }, 1000); // 1秒
  }
});
