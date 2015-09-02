var EditUserBox = React.createClass({
  componentDidMount: function() {
    this.loadUsersFromServer();
  },
  getInitialState: function() {
    var url = window.location.href;
    var prof_id = url.split('/user/')[1];

    return {
      url: 'http://localhost:3000/api/user/' + prof_id,
      user_level: sessionStorage.getItem('user_level'),
      user_id: sessionStorage.getItem('id'),
      auth_token: sessionStorage.getItem('authentication'),
    };
  },
  loadUsersFromServer: function() {
    $.ajax({
      url: this.state.url,
      beforeSend: function(req) {
        req.setRequestHeader("Authorization", sessionStorage.getItem('authentication'));
      },
      dataType: 'json',
      cache: false,
      success: function(data) {
        // this.setState({
        //
        // });
        console.log(data);
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  render: function() {
    return (
      <div className="row">
        <div className="container">
          <div className="col-lg-8 col-md-8 col-xs-12">
            <div className="page-header">
              <h1>
                {(this.state.user_level < 4) ? 'View Profile' : 'Edit Profile'}
                <br />
                <small>temporary email holder</small>
              </h1>
            </div>
            {this.state.url}
            <table className="table">
              <tr>
                <th>
                  Email
                </th>
                <td>
                  temporary email holder
                </td>
              </tr>
            </table>
          </div>
        </div>
        <UserChangePassword />
        <UserAssignedRoutes />
      </div>
    );
  }
});
