var $editLinkTitle, $editLinkUrl;

$(document).ready(function(){

  $(".edit-link").on('click', renderEdit);
  
})

function editLink(e){
  e.preventDefault();

  $editLinkTitle = $("#edit-link-title");
  $editLinkUrl  = $("#edit-link-url");
  var $this = $(this);
  var linkId = $this.parents('.link').data('id');
  closeEdit(linkId)

  $.ajax({
    url: '/api/v1/links/' + linkId,
    method: 'PATCH',
    data: { 
            url: $editLinkUrl.val(),
            title: $editLinkTitle.val()
          }
  })
  .then(updateLinkStatus)
  .fail(displayFailure);
}

function updateLinkStatus(link) {
  debugger
  $(`.link[data-id=${link.id}]`).find(".link-url").text(link.url);
  $(`.link[data-id=${link.id}]`).find(".link-title").text(link.title);
}

function displayFailure(failureData){
  console.log("FAILED attempt to update Link: " + failureData.responseText);
};


function renderEdit(link){
  var $this = $(this);
  var linkId = $this.parents('.link').data('id');
  $(`.link[data-id=${linkId}]`).children('.link_buttons').append( editLinkHTML(link) )
  $(`.link[data-id=${linkId}]`).children('.link_buttons').children('.edit-link').hide()
  $('.edit-link').hide()
  $("#close-edit-link").on('click', closeEdit(linkId));
  $("#edit-link-form").on('submit', editLink);
}

function closeEdit(linkId){
  $(`.link[data-id=${linkId}]`).children('.link_buttons').children('#edit-link-form-div').remove()
  $('.edit-link').show()
}

function editLinkHTML(link) {

    return `    <div id='edit-link-form-div'>
                  <form id='edit-link-form'>
                    <label>URL:
                      <input id="edit-link-url">
                    </label>
                    <label>Title:
                      <input id="edit-link-title">
                    </label>
                    <input type="submit" value="Edit Link">
                  </form>
                  <button id='close-edit-link'>Close Edit</button>
                </div>
            `
}

function clearLink() {
  $editLinkTitle.val("");
  $editLinkUrl.val("");
}

function displayFailure(failureData){
  console.log("FAILED attempt to create new Link: " + failureData.responseText);
  clearLink();
}