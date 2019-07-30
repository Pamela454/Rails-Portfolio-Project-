$(document).ready(() => {  //is this needed? 
	console.log('messages.js is loaded ...')
	listenForClick()
	//listenForNewMessageFormClick()
	//responseHandler()
	//formSubmissionClick()
	newMessageHandler()
});

let userId = function retriveuserId(){
	return $('h2#userid').data('user-id')
}  


//index of user's questions asked is displayed 
function listenForClick() {
	console.log('setting up click handler');
	$("button#messages-data").on('click', event => {
	console.log('button clicked');
		event.preventDefault()  //prevent default rendering when button is clicked 
		//getMessages()
		//history.pushState(null, null, "messages") //this gives wrong url
		var url = `${userId()}/messages.json`
		fetch(url, {
			//headers: {
            //	'Content-Type': 'application/json',
            	// 'Content-Type': 'application/x-www-form-urlencoded',
        	//	}
        	})
			.then(res => res.json()) 
			.then(allMessages => {
				$('.square').html('')
				console.log(allMessages)
				//return Promise.resolve("Dummy response to keep the console quiet");
				allMessages.forEach(message => {
                    let newMessage = new Message(message)
                    let messageHtml = newMessage.postHTML()
                    $('.square').append(messageHtml)
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
      
//function formSubmissionClick() {
//	$("button#new-question").submit(function(event){
//	event.preventDefault()
//	console.log('hello')
//	let submission = $(this).serialize()
//	console.log(submission)
//	$.post(`${userId()}/messages`, submission).done(function(data){
//	})
 // })
//}

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

	const responseHtml = this.responses

	const newResponses = new Response(responseHtml)

	function Response(response) {  
		this.id = response.id
		this.response = response.response
		this.physician_id = response.physician_id
		this.message_id = response.message_id
	}


	let postHtml = `
	   <h3>Id:${this.id}</h3>
	   <h3>Title: ${this.title}</h3>
	   <h3>Question: ${this.question}</h3>
	   <h3>${newResponses}</h3> 
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
		console.log("get show page")
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

                    $('.box').append(messageHtml)
                })

			.catch(error => console.error('Error:', error));

	})	
}

 

function newMessageHandler(event) {
	console.log("new message handled")
	//$('form').submit
	$("#new_message").on("submit", function(e) {
        e.preventDefault()
        const values = $(this).serialize()  
        console.log(`${userId()}`)
        console.log(`/users/${userId()}/messages`)
        var posting = $.post(`/users/${userId()}/messages`, values).done(function(data) {
        const newMessage = new Message(data)
        const htmlMessage = newMessage.formatShow()
        $(".container").html(htmlMessage)
      })
	})
}



