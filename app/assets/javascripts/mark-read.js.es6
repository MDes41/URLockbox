
$(document).ready(function(){
 $('.mark-unread').off('click')
 $('.mark-read').off('click')
 $('.mark-read').on('click', markAsRead)
 $('.mark-unread').on('click', markAsUnread)
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
  .then(markAsReadStatus)
  .fail(displayFailure);
}

function markAsUnread(e){
  e.preventDefault();

  var $this = $(this);
  var linkId = $this.parents('.link').data('id');
  $.ajax({
    url: '/api/v1/links/' + linkId,
    method: 'PATCH',
    data: {read: false}
  })
  .then(markAsUnreadStatus)
  .fail(displayFailure);
}

function markAsReadStatus(link) {
  $(`.link[data-id=${link.id}]`).children('.inside-link').addClass('greyed-out');
  $(`.link[data-id=${link.id}]`).find(".link_read").text('Read: ' + link.read);
  $(`.link[data-id=${link.id}]`).children('.inside-link').children('.link_buttons').children('button.mark-read').remove()
  $(`.link[data-id=${link.id}]`).children('.inside-link').children('.link_buttons').prepend( buttonUnread )
  $('.mark-unread').off('click')
  $('.mark-unread').on('click', markAsUnread)
}

function markAsUnreadStatus(link) {
  $(`.link[data-id=${link.id}]`).children('.inside-link').addClass('greyed-out');
  $(`.link[data-id=${link.id}]`).children('.inside-link').removeClass('greyed-out');
  $(`.link[data-id=${link.id}]`).find(".link_read").text('Read: ' + link.read);
  $(`.link[data-id=${link.id}]`).children('.inside-link').children('.link_buttons').children('button.mark-unread').remove()
  $(`.link[data-id=${link.id}]`).children('.inside-link').children('.link_buttons').prepend( buttonRead )
  $('.mark-read').off('click')
  $('.mark-read').on('click', markAsRead)
}


function buttonUnread(link) {

    return `<button class="mark-unread">Mark as Unread</button>`
                
}

function buttonRead(link) {

    return `<button class="mark-read">Mark as Read</button>`
                
}

