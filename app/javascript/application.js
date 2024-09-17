import { Turbo } from "@hotwired/turbo-rails";
Turbo.start();

document.addEventListener("DOMContentLoaded", () => {
  const initialMessage = document.querySelector('.initial-message');
  const choicesSection = document.querySelector('.choices');

  if (initialMessage) {
    // 初期メッセージを1秒後に非表示にする
    setTimeout(() => {
      initialMessage.style.display = 'none';
      if (choicesSection) {
        choicesSection.style.display = 'flex'; // 画像リンクを表示
      }
    }, 1000); // 1秒
  }
});
