$(document).ready(() => {  //is this needed? 
	console.log('messages.js is loaded ...')
	listenForClick()
	listenForNewMessageFormClick()
});

let userId = function finduserId() {
	return $('button#messages-data').data('user-id')
}

function listenForClick() {
	console.log('setting up click handler');
	$('button#messages-data').on('click', function (event) {
	console.log('button clicked');
		event.preventDefault()  //prevent default rendering when button is clicked 
		//getMessages()
		fetch('/users/${userId()}/messages.json') 
			.then(res => res.json()) //parsing the data
			.then(allMessages => {
				$('.container').html('')
				console.log('Asked data from index')
				return Promise.resolve("Dummy response to keep the console quiet");
				allMessages.forEach(messages => {
                    let newMessage = new Message(message)
                    let messageHtml = newMessage.formatIndex()
                    $('.container').append(messageHtml)
                })
			})

	})
}

//function getMessages() {
//	$.ajax({
//		url: '/messages',
//		method: 'get',
//		dataType: 'json',
//		success: function (data) {
//			console.log("the data is: ", data)
//			data.map(post => {
//				const newMessage = new Message(message)
//				const newMessageHtml = newMessage.postHTML()
//				document.getElementById('ajax-messages').innerHTML += newMessageHtml
//			})
//		}
//	})
//}

function listenForNewMessageFormClick() {
	$('button#ajax-new-message').on('click', function (event) {
		event.preventDefault()
		let newMessageForm = Message.newMessageForm()
		// $('div#new-post-form-div')
		document.querySelector('div#new-message-form-div').innerHTML = newMessageForm
	})
}

function Message(message) {
		this.id = message.id
		this.title = message.title
		this.question = message.question
		this.responses = message.responses
}

function newMessageForm() {
		return (`
		<strong>New message comment form</strong>
			<form>
				<input id='message-title' type='text' name='title'></input><br>
				<input type='text' name='question'></input><br>
				<input type='submit' />
			</form>
		`)
}

Message.prototype.postHTML = function () {
	let messageResponses = this.responses.map(comment => {
		return (`
			<p>${responses.content}</p>
		`)
	}).join('')

	return (`	
		<div class='message'>
			<h3>${this.title}</h3>
			<p>${this.content}</p>
			<p>${postComments}</p>
		</div>
	`)
}

