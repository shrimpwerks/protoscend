var EditUserBox = React.createClass({
  componentDidMount: function() {
    this.loadUsersFromServer();
  },
  getInitialState: function() {
    return {
      url: 'http://localhost:3000/api/user/' + this.props.id,
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
        this.setState({
          edit_id: data.id,
          edit_email: data.email,
          edit_fname: data.fname,
          edit_lname: data.lname,
          edit_user_level: data.user_level,
          edit_small_group: data.small_group
        });
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  handleChange: function(e) {
    console.log(e);
    this.setState({edit_email: e.target.value});
  },
  render: function() {
    return (
      <div className="row">
        <div className="container">
          <div className="col-lg-8 col-md-8 col-xs-12">
            <div className="page-header">
              <h1>
                {
                  (this.state.user_level >= 4 || this.state.user_id === this.state.edit_id) ?
                    'Edit Profile' : 'View Profile'
                }
                <br />
                <small>{this.state.edit_email}</small>
              </h1>
            </div>
            <table className="table">
              <tr>
                <th>
                  Email
                </th>
                <td>
                  {
                    (this.state.user_level >= 4 || this.state.user_id === this.state.edit_id) ?
                      <input type="text" name="edit_user_email" className="form-control" value={this.state.edit_email} onChange={this.handleChange} /> :
                      (this.state.edit_email)
                  }
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
