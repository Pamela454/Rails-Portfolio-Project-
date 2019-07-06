$(function () {
	console.log('messages.js is loaded ...')
	listenForClick()
	listenForNewMessageFormClick()
});

function listenForClick() {
	$('button#messages-data').on('click', function (event) {
		event.preventDefault()
		getMessages()
	})
}

function getMessages() {
	$.ajax({
		url: 'http://localhost:3000/user/user_id/messages',
		method: 'get',
		dataType: 'json',
		success: function (data) {
			console.log("the data is: ", data)
			data.map(post => {
				const newMessage = new Message(message)
				const newMessageHtml = newMessage.postHTML()
				document.getElementById('ajax-messages').innerHTML += newMessageHtml
			})
		}
	})
}

function listenForNewMessageFormClick() {
	$('button#ajax-new-message').on('click', function (event) {
		event.preventDefault()
		let newMessageForm = Message.newMessageForm()
		// $('div#new-post-form-div')
		document.querySelector('div#new-message-form-div').innerHTML = newMessageForm
	})
}

class Message {
	constructor(obj) {
		this.id = obj.id
		this.title = obj.title
		this.question = obj.question
		this.responses = obj.responses
	}

	static newMessageForm() {
		return (`
		<strong>New message comment form</strong>
			<form>
				<input id='message-title' type='text' name='title'></input><br>
				<input type='text' name='question'></input><br>
				<input type='submit' />
			</form>
		`)
	}
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

