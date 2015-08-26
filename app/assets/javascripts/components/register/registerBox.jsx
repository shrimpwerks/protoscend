var RegisterBox = React.createClass({
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
        // $("#login_error_message").hide();
        // $("#routing_error_message").hide();
        // $("#logout_button").show();
      }.bind(this),
      error: function(xhr, status, err) {
        // console.error(this.props.url, status, err.toString());
        $("#login_error_message").show("slow");
      }.bind(this)
    });
  },
  render: function() {
    return (
      <div className="CreateUserBox">
        <div className="col-lg-3 col-md-3 col-sm-3"></div>
        <div className="col-lg-6 col-md-6 col-sm-6">
          <h1><p className="text-center">Create Profile</p></h1>
          <form className="form-horizontal" onSubmit={this.handleSubmit}>
                <div className="form-group">
                    <label className="col-sm-4 control-label">Email</label>
                    <div className="col-sm-8">
                        <input type="email" className="form-control" ref="email" name="email" placeholder="Email" required />
                    </div>
                </div>
                <div className="form-group">
                    <label className="col-sm-4 control-label">First Name</label>
                    <div className="col-sm-8">
                        <input type="text" className="form-control" ref="fname" name="fname" placeholder="First Name" required />
                    </div>
                </div>
                <div className="form-group">
                    <label className="col-sm-4 control-label">Last Name</label>
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
        <div className="col-lg-3 col-md-3 col-sm-3"></div>
      </div>
    );
  }
});
