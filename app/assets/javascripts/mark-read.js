
$(document).ready(function(){
 $('.mark-read').on('click', markAsRead)
})

function markAsRead(e){
  e.preventDefault();

  var $this = $(this);
  var linkId = $this.parents('.link').data('id');
  
  $.ajax({
    url: '/api/v1/links/' + linkId,
    method: 'PATCH',
    data: {read: true}
  })
  .then(updateLinkStatus)
  .fail(displayFailure);
}

function updateLinkStatus(link) {
  $(`.link[data-id=${link.id}]`).find(".link_read").text(link.read);
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
};
