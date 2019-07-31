$(document).ready(() => {  
	console.log('messages.js is loaded ...')
	listenForClick()
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

	var responseHtml = "" 
	this.responses.forEach(function(response) {
			var newResponse = new Response(response)
			 responseHtml += newResponse.response
	}) 

	let postHtml = 
	`  <h3>Id:${this.id}</h3>
	   <h3>Title: ${this.title}</h3>
	   <h3>Question: ${this.question}</h3>
	   <h3>Response: ${responseHtml}</h3> 
	`
	return postHtml
}

     //a#responses-data'
function responseHandler() {
	$(document).on('click', "a#responses-data", function(e) {
		console.log("get show page")
		event.preventDefault()
	    let messageId = $(this).data('message-id')
	    console.log(messageId)
		var answers = `${userId()}/messages/${messageId}.json` 
		fetch(answers, {   
       	})
			.then(res => res.json()) 
			.then(showMessage => {
				console.log(showMessage)
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
        $(".carton").html(htmlMessage)
      })
	})
}



