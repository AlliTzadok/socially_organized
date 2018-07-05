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
