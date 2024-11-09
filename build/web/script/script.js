//document.querySelectorAll('.btn').forEach(button => {
//    button.addEventListener('click', function () {
//        // Check if the clicked button is already locked/disabled
//        if (this.classList.contains('locked')) {
//            return; // If locked, do nothing
//        }
//
//        // Find the currently locked/disabled button and unlock/enable it
//        const currentlyLockedButton = document.querySelector('.btn.locked');
//        if (currentlyLockedButton) {
//            currentlyLockedButton.classList.remove('locked'); // Unlock the previously locked button
//            currentlyLockedButton.removeAttribute('disabled'); // Remove the disabled attribute
//        }
//
//        // Lock and disable the clicked button
//        this.classList.add('locked');
//        this.setAttribute('disabled', true); // Disable the clicked button
//
//        // Get the target collapse content
//        const target = document.querySelector(this.getAttribute('data-bs-target'));
//
//        // Close any open collapse
//        document.querySelectorAll('.collapse.show').forEach(collapse => {
//            collapse.classList.remove('show');
//        });
//
//        // Open the clicked collapse
//        target.classList.add('show');
//    });
//});

