var UserList = React.createClass({
  handleRowClick: function(id) {
    console.log(id);
  },
  render: function() {
    var userNodes = this.props.data.map(function (user) {
      return (
          <tr key={user.id} onClick={(()=>{window.document.location="/user/" + user.id})}>
          <td>{user.fname}</td>
          <td>{user.lname}</td>
          <td>{user.email}</td>
          <td>
            {(function() {
              switch (user.user_level) {
                case 0:   return "General";
                case 1:   return "Setter";
                case 2:   return "Staff";
                case 3:   return "Supervisor";
                case 4:   return "Route Manager";
                case 5:   return "Admin";
                default:  return "N/A";
              }
            })()}
          </td>
          <td>{user.route_count}</td>
        </tr>
      );
    });
    return (
      <tbody className="view_users">
        <tr>
          <th><a onClick={this.props.handleClick.bind(null, 'fname')}>First Name</a></th>
          <th><a onClick={this.props.handleClick.bind(null, 'lname')}>Last Name</a></th>
          <th><a onClick={this.props.handleClick.bind(null, 'email')}>Email</a></th>
          <th><a onClick={this.props.handleClick.bind(null, 'user_level')}>Access</a></th>
          <th><a onClick={this.props.handleClick.bind(null, 'route_count')}>Number of Routes</a></th>
        </tr>
        {userNodes}
      </tbody>
    );
  }
});
