var LoginBox = React.createClass({
  getInitialState: function() {
    return {
      url: 'http://localhost:3000/api/authentication/'
    };
  },
  componentWillMount: function() {
    // prevent render if the user is logged in.
    // sessionStorage.removeItem('authentication');
    if (sessionStorage.getItem('authentication')) {
      this.render = function() {
        return false;
      }
    }
  },
  handleSubmit: function(e) {
    e.preventDefault();
    this.handleLogin(React.findDOMNode(this.refs.email).value.trim(), React.findDOMNode(this.refs.password).value.trim());
    this.unmount();
  },
  handleLogin: function(email, password) {
    $.ajax({
      type: "POST",
      url: this.state.url,
      dataType: 'json',
      data: {
        email: email,
        password: password
      },
      cache: false,
      success: function(data) {
        sessionStorage.setItem('authentication', data.user.auth_token);
        sessionStorage.setItem('id', data.user.id);
        sessionStorage.setItem('email', data.user.email);
        sessionStorage.setItem('fname', data.user.fname);
        sessionStorage.setItem('lname', data.user.lname);
        sessionStorage.setItem('small_group', data.user.small_groups_id);
        sessionStorage.setItem('user_level', data.user.user_level);
        console.log(data);
        // $("#loading_users_spinner").addClass('hide');
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  unmount: function() {
    var node = this.getDOMNode();
    React.unmountComponentAtNode(node);
    $(node).remove();
  },
  componentDidMount: function() {
  },
  render: function() {
    return (
      <div className="loginBox">
        <form onSubmit={this.handleSubmit}>
          <div className="well">
            <h2>Login:</h2>
            <input type="text" className="form-control" ref="email" placeholder="Email"/>
            <br />
            <input type="password" className="form-control" ref="password" placeholder="Password"/>
            <br />
            <input type="submit" className="form-control" />
            <br />
            <a href="#">forgot password</a>
            <br />
            <a href="#">request account</a>
          </div>
        </form>
      </div>
    );
  }
});
