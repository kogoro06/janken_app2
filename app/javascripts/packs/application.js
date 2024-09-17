// app/javascript/application.js

import { Turbo } from "@hotwired/turbo-rails";
import "./controllers";
import "bootstrap";
import "@popperjs/core";

// Start Turbo
Turbo.start();

// Handle the initial message display
document.addEventListener("DOMContentLoaded", () => {
  const initialMessage = document.querySelector('.initial-message');
  const choicesSection = document.querySelector('.choices');

  if (initialMessage) {
    // Hide the initial message after 1 second
    setTimeout(() => {
      initialMessage.style.display = 'none';
      if (choicesSection) {
        choicesSection.style.display = 'flex'; // Show choices section
      }
    }, 1000); // 1 second
  }
});
