$(document).ready(() => {  //is this needed? 
	console.log('messages.js is loaded ...')
	listenForClick()
	listenForNewMessageFormClick()
});

let userId = function retriveuserId(){
	return $('h2#userid').data('user-id')
}

function listenForClick() {
	console.log('setting up click handler');
	$('button#messages-data').on('click', event => {
	console.log('button clicked');
		event.preventDefault()  //prevent default rendering when button is clicked 
		//getMessages()
		var url = `${userId()}/messages.json`
		console.log(`THIS IS THE URL YOU ARE USING: ${url}`)
		fetch(url, {
			headers: {
            	'Content-Type': 'application/json',
            	// 'Content-Type': 'application/x-www-form-urlencoded',
        		}
        	})
			.then(res => res.json()) 
			.then(allMessages => {
				$('.container').html(`${allMessages}`)
				console.log('Asked data from index')
				return Promise.resolve("Dummy response to keep the console quiet");
				allMessages.forEach(messages => {
                    let newMessage = new Message(message)
                    let messageHtml = newMessage.postHTML()
                    $('.container').append(messageHtml)
                })
			})
			.catch(error => console.error('Error:', error));

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

function Message(message) {   //constructor function 
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

//prototype function called on constructor, can't use arrow function 
Message.prototype.postHTML = function () {
	let postHtml = `<a href= "${this.id}/messages" data-id= "${this.id}" class = "show-messages"><h1>${this.title}</h1></a>` 
    
    return postHtml
}

