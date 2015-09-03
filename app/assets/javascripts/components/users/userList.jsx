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
          <td>{user.routes_count}</td>
        </tr>
      );
    });
    return (
      <table className="table table-striped table-hover">
        <thead>
          <tr>
            <th onClick={this.props.handleClick.bind(null, 'fname')}>First Name</th>
            <th onClick={this.props.handleClick.bind(null, 'lname')}>Last Name</th>
            <th onClick={this.props.handleClick.bind(null, 'email')}>Email</th>
            <th onClick={this.props.handleClick.bind(null, 'user_level')}>Access</th>
            <th onClick={this.props.handleClick.bind(null, 'routes_count')}>Number of Routes</th>
          </tr>
        </thead>
        <tbody className="view_users">
          {userNodes}
        </tbody>
      </table>
    );
  }
});
