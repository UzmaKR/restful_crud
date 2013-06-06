$(document).ready(function() {

    $(".delete_me").on('click', function(e) {
        e.preventDefault();
        var href_tag = $(this).attr('href');
        console.log(href_tag);
        var result = confirm("Want to delete?");
        if (result == true) {
            $.ajax({
              type: "POST",
              url: href_tag
            });
          $(this).closest('tr').slideUp();
        }
    });
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
