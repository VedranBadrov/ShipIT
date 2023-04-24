const boxes = document.querySelectorAll('.portal-box');

boxes.forEach(box => {
  box.addEventListener('click', () => {
    box.classList.add('selected');
    boxes.forEach(b => {
      if (b != box) {
        b.classList.remove('selected');
      }
    });
  });
});

