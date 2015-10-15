var UserTable = React.createClass({
  render: function() {
    var userTableBodyRows = this.props.data.map(function (user) {
      return (
        <tr onClick={(() => { window.document.location="/user/" + user.id })}>
          <td>{user.fname}</td>
          <td>{user.lname}</td>
          <td>{user.email}</td>
          <td>{user.user_level}</td>
          <td>{user.routes_count}</td>
        </tr>
      );
    });

    return (
      <table className="table table-striped table-hover view_users">
        <thead>
          <tr>
            <UserTableHeader
              label="First Name"
              column="fname"
              order={this.props.order}
              sort_by={this.props.sort_by}
              handleClick={this.props.handleClick}
            />
            <UserTableHeader
              label="Last Name"
              column="lname"
              order={this.props.order}
              sort_by={this.props.sort_by}
              handleClick={this.props.handleClick}
            />
            <UserTableHeader
              label="Email"
              column="email"
              order={this.props.order}
              sort_by={this.props.sort_by}
              handleClick={this.props.handleClick}
            />
            <UserTableHeader
              label="Access"
              column="user_level"
              order={this.props.order}
              sort_by={this.props.sort_by}
              handleClick={this.props.handleClick}
            />
            <UserTableHeader
              label="Number of Routes"
              column="routes_count"
              order={this.props.order}
              sort_by={this.props.sort_by}
              handleClick={this.props.handleClick}
            />
          </tr>
        </thead>
        <tbody>
          {userTableBodyRows}
        </tbody>
      </table>
    );
  }
});
