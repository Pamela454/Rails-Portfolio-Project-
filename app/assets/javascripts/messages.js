$(document).ready(() => {  //is this needed? 
	console.log('messages.js is loaded ...')
	listenForClick()
	//listenForNewMessageFormClick()
	responseHandler()
	formSubmissionClick()
	test23()
	newMessageHandler()
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
		history.pushState(null, null, "messages") //this gives wrong url
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


//function listenforMessageClick() {
//    $('.responses-data').on('click', function (event) {
//		event.preventDefault()
//		console.log(this)
//		var answers = `${this.responses}`
//		fetch(answers, {
//        	})
//			.then(res => res.json()) 
//			.then(allResponses => {
//				$('.square').html('')
//				console.log(allResponses)
//				allResponses.forEach(response => {
//                    let newMessage = new Message(message)
//                    let messageHtml = newMessage.postHTML()
//                    $('.box').append(messageHtml)
//                })
//			})
//			.catch(error => console.error('Error:', error));
//
//	})
//}

//function listenForNewMessageFormClick() {
//	$(".ajax-new-message").on('click', event => {
//		event.preventDefault()
//		let newForm = newMessageForm()
//		// $('div#new-post-form-div')
//		document.querySelector('div#new-message-form-div').innerHTML = newForm
//	})                          
//}
      
function formSubmissionClick() {
	$("button#new-question").submit(function(event){
	event.preventDefault()
	console.log('hello')
	let submission = $(this).serialize()
	console.log(submission)
	$.post(`${userId()}/messages`, submission).done(function(data){
	})
  })
}

function Message(message) {   //constructor function 
		this.id = message.id
		this.title = message.title
		this.question = message.question
		this.responses = message.responses
	}

function Response(response) {   //constructor function 
		this.id = response.id
		this.response = response.response
		this.physician_id = response.physician_id
		this.message_id = response.message_id
	}

//function newMessageForm() {
//		return (`
//		<strong>New Question Form</strong>
//			<form>
//				<input id='message-title' type='text' name='title'> Title</input><br>
//				<input type='text' name='question'> Question</input><br>  
//				<input type="button" id="new-question" value="Submit" onclick="formSubmissionClick()"/>
//			</form>
//		`)
//}   //ES6 template literals


//let postHtml = `<a href= "${this.id}/messages" data-id= "${this.id}" class = "show-messages"><h1>${this.title}</h1></a>` 


//prototype function called on constructor, can't use arrow function 
Message.prototype.postHTML = function () {
	return (`    
	<div class='message'>
	 <h2>Id: ${this.id}</h2>
	 <a href="${userId()}/messages/${this.id}" id='responses-data' data-message-id= '${this.id}' onclick="responseHandler()"><h1>${this.title}</h1></a>
	</div>
   `)  
    return postHtml
}  //add function to format message response. 

Message.prototype.formatShow = function () {

	let responseHtml = this.responses


	let postHtml = `
	   <h3>${this.id}</h3>
	   <h3>${this.title}</h3>
	   <h3>${this.question}</h3>
	   <h3>${responseHtml}</h3> 
	`

	return postHtml
}


//Response.prototype.postHTML = function () {
//	return (`    
//	<div class='message'>
//	 <h2>Id: ${this.id}</h2>
//	 <h2>Response: ${this.response}</h2>
//	 <h2>Physician Id: ${this.physician_id}</h2>
//	 <h2>Message Id: ${this.message_id}</h2>
//	</div>
//  `)
//    return postHtml
//} 

function responseHandler() {
	$(document).on('click', "a#responses-data", function(e) {
		event.preventDefault()
	    let messageId = $('a#responses-data').data('message-id')
		var answers = `${userId()}/messages/${messageId}.json`  
		fetch(answers, {   
        	})
			.then(res => res.json()) 
			.then(showMessage => {
				$('.box').html('')

                    let newMessage = new Message(showMessage)
                    let messageHtml = newMessage.formatShow()
                    console.log(messageHtml)

                    $('.box').append(messageHtml)
                })

			.catch(error => console.error('Error:', error));

	})	
}

function test23() {
	console.log('attempting to wire up btn handler')
$('.btn.btn-primary').on('submit', function(e) {
	e.preventDefault()
	console.log("hello")
})	
}

function newMessageHandler(event) {
	console.log("new message handled")
	$("#new_message").on("submit", function(e) {
        e.preventDefault()
	})
}



