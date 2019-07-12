$(document).ready(() => {  //is this needed? 
	console.log('messages.js is loaded ...')
	listenForClick()
	listenForNewMessageFormClick()
});

let userId = function retriveuserId(){
	return $('h2#userid').data('user-id')
}

//index of user's questions asked is displayed 
function listenForClick() {
	console.log('setting up click handler');
	$('button#messages-data').on('click', event => {
	console.log('button clicked');
		event.preventDefault()  //prevent default rendering when button is clicked 
		//getMessages()
		var url = `${userId()}/messages.json`
		fetch(url, {
			//headers: {
            //	'Content-Type': 'application/json',
            	// 'Content-Type': 'application/x-www-form-urlencoded',
        	//	}
        	})
			.then(res => res.json()) 
			.then(allMessages => {
				$('.box').html('')
				console.log(allMessages)
				//return Promise.resolve("Dummy response to keep the console quiet");
				allMessages.forEach(message => {
                    let newMessage = new Message(message)
                    let messageHtml = newMessage.postHTML()
                    $('.box').append(messageHtml)
                })
			})
			.catch(error => console.error('Error:', error));

	})
}

//function to view individual question, display comments in has many relationship 

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

function listenforMessageClick() {
    $('.responses-data').on('click', function (event) {
		event.preventDefault()
		console.log(this)
		var answers = `${this.responses}`
		fetch(answers, {
        	})
			.then(res => res.json()) 
			.then(allResponses => {
				$('.square').html('')
				console.log(allResponses)
				allResponses.forEach(response => {
                    let newMessage = new Message(message)
                    let messageHtml = newMessage.postHTML()
                    $('.box').append(messageHtml)
                })
			})
			.catch(error => console.error('Error:', error));

	})
}

function listenForNewMessageFormClick() {
	$('.ajax-new-message').on('click', function (event) {
		event.preventDefault()
		let newForm = newMessageForm()
		// $('div#new-post-form-div')
		document.querySelector('div#new-message-form-div').innerHTML = newForm
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
				<input id='message-title' type='text' name='title'> Title</input><br>
				<input type='text' name='question'> Question</input><br>
				<input type='submit' />
			</form>
		`)
}   //ES6 template literals


//let postHtml = `<a href= "${this.id}/messages" data-id= "${this.id}" class = "show-messages"><h1>${this.title}</h1></a>` 


//prototype function called on constructor, can't use arrow function 
Message.prototype.postHTML = function () {
	return (`    
	<div class='message'>
	 <h2>Title: ${this.title}</h2>
	 <h2>Question: ${this.question}</h2>
	 <button id='responses-data'>Show Responses</button>
	</div>
   `)
    
    return postHtml
}  //add function to format message response. 




