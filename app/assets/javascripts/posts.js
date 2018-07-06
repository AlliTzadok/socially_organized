function postsIndex(event){
    event.preventDefault()
    var url = "http://localhost:3000/";
    $("#dashboard-view").empty();
    $.get(url+"posts.json", function(response){
      var user = response.user;
      response.posts.forEach(function(post){
        $("#dashboard-view").append(`
          <div id="post-${post.id}">
          <h4>
          <a href="posts/${post.id}">${post.title}
          </a>
          <p> ${post.content} </p>
          </h4>
          </div>
          `)
      })
    })
  }


//need to work on this function. Error says post is not defined.
function postShow(event){
  event.preventDefault()
  var url = "http://localhost:3000/posts";
  $("#posts").empty();
  $.get(url+`${post.id}.json`, function(response){
    var post = response.post;
    debugger
  })
}

function newPost(event){
    event.preventDefault()

    var url = "http://localhost:3000/";
    $("#dashboard-view").empty();
    $.get(url+"posts/new", function(response){
      // debugger
      var user = response.user;
      $("#dashboard-view").html(response)
    })
  }
