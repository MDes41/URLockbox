$(document).ready(function(){
  $(".delete-link").off('click');
  $(".delete-link").on('click', deleteLink);
})

function deleteLink (event){
  event.preventDefault();

  console.log("delete")

  var $link = $(this).parents('.link')
  var linkId = $link.data('id');

  $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'DELETE',
    })
   .then(removeLink)
   .fail(displayFailure )
 }

function removeLink(link){
  $(`#link-${link.id}`).remove();
}

