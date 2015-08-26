var NewUserBox = React.createClass({
  getInitialState: function() {
    return {
      url: 'http://localhost:3000/api/user/'
    };
  },
  handleSubmit: function(e) {
    e.preventDefault();
    var email = React.findDOMNode(this.refs.email).value.trim(),
        fname = React.findDOMNode(this.refs.fname).value.trim(),
        lname = React.findDOMNode(this.refs.lname).value.trim(),
        password = React.findDOMNode(this.refs.password).value.trim(),
        password_confirm = React.findDOMNode(this.refs.password_confirm).value.trim();

    this.sendRequest(email, fname, lname, password, password_confirm);
  },
  sendRequest: function(email, fname, lname, password, password_confirm) {
    $.ajax({
      type: "POST",
      url: this.state.url,
      dataType: 'json',
      data: {
        email: email,
        fname: fname,
        lname: lname,
        password: password,
        password_confirm: password_confirm
      },
      cache: false,
      success: function(data) {
        console.log(data);
        this.showSuccessMessage(data.success);
      }.bind(this),
      error: function(xhr, status, err) {
        console.log(xhr.responseJSON.errors);
        this.showErrorMessage(xhr.responseJSON.errors);
      }.bind(this)
    });
  },
  showErrorMessage: function(errors) {
    $("#new_user_error_message").empty();
    $("#new_user_error_message").append("<ul>");
    $.each(errors, function(i, val) {
      if (i === 'fname') i = 'First name';
      if (i === 'lname') i = 'Last name';
      if (i === 'password') i = 'Password';
      if (i === 'email') i = 'Email';
      $.each(val, function() {
        $("#new_user_error_message").append("<li>" + i + " is " + this + "</li>");
      });
    });
    $("#new_user_error_message").append("</ul>");
    $("#new_user_error_message").show();
  },
  showSuccessMessage: function(success) {
    $("#new_user_error_message").hide();
    $("#new_user_success_message").text(success);
    $('#new_user_form')[0].reset();
    $("#new_user_success_message").show();

  },
  render: function() {
    return (
      <div className="CreateUserBox">
        <div className="col-lg-3 col-md-3 col-sm-3">
          <div className="form-group">
            <div className="col-lg-12 col-md-12 col-sm-12  ">
              <div id="new_user_error_message" className="alert alert-danger" role="alert" style={{display: 'none'}}></div>
            </div>
            <div className="col-lg-12 col-md-12 col-sm-12  ">
              <div id="new_user_success_message" className="alert alert-success" role="alert" style={{display: 'none'}}></div>
            </div>
          </div>
        </div>
        <div className="col-lg-6 col-md-6 col-sm-6">
          <h1><p className="text-center">Create Profile</p></h1>
          <form id="new_user_form" className="form-horizontal" onSubmit={this.handleSubmit}>
            <div className="form-group">

            </div>
            <div className="form-group">
              <label className="col-sm-4 control-label">Email</label>
              <div className="col-sm-8">
                <input type="email" className="form-control" ref="email" name="email" placeholder="Email" required />
              </div>
            </div>
            <div className="form-group">
              <label className="col-sm-4 control-label">First name</label>
              <div className="col-sm-8">
                <input type="text" className="form-control" ref="fname" name="fname" placeholder="First Name" required />
              </div>
            </div>
            <div className="form-group">
              <label className="col-sm-4 control-label">Last name</label>
              <div className="col-sm-8">
                <input type="text" className="form-control" ref="lname" name="lname" placeholder="Last Name" required />
              </div>
            </div>
            <div className="form-group">
              <label className="col-sm-4 control-label">Password</label>
              <div className="col-sm-8">
                <input type="password" className="form-control" ref="password" name="password" placeholder="Password" required />
              </div>
            </div>
            <div className="form-group">
              <label className="col-sm-4 control-label">Repeat Password</label>
              <div className="col-sm-8">
                <input type="password" className="form-control" ref="password_confirm" name="password_confirm" placeholder="Password" required />
              </div>
            </div>
            <div className="form-group">
              <div className="col-sm-offset-9">
                <button type="submit" className="btn btn-primary">Create Account</button>
              </div>
            </div>
          </form>
        </div>
        <div className="col-lg-3 col-md-3 col-sm-3">
        </div>
      </div>
    );
  }
});
