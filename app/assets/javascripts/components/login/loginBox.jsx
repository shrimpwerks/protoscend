var LoginBox = React.createClass({
  getInitialState: function() {
    return {username: ''};
  },
  handleSubmit: function(e) {
    e.preventDefault();
    this.unmount();
  },
  unmount: function() {
    var node = this.getDOMNode();
    React.unmountComponentAtNode(node);
    $(node).remove();
  },
  componentDidMount: function() {
    // this.loadAnnouncementFromServer();
  },
  render: function() {
    return (
      <div className="loginBox">
        <form onSubmit={this.handleSubmit}>
          <div className="well">
            <h2>Login:</h2>
            <input type="text" className="form-control" placeholder="Email"/>
            <br />
            <input type="password" className="form-control" placeholder="Password"/>
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
