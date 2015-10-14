var UserBox = React.createClass({
  getInitialState: function() {
    return {
      data: [],
      users: [],
      s_fname: '',
      s_lname: '',
      s_email: '',
      sort_by: '',
      order: 'ASC'
    };
  },

  handleSearch: function(s) {
    // Retrieve form fields from state
    var firstName = s.fname;
    var lastName = s.lname;
    var email = s.email;

    // Retrieve cached data set
    var users = this.state.data;

    // Filter based on present form fields
    if (firstName) {
      users = users.filter(function(user) {
        return user.fname.toLowerCase().match(new RegExp(firstName.toLowerCase())) ? true : false;
      });
    }
    if (lastName) {
      users = users.filter(function(user) {
        return user.lname.toLowerCase().match(new RegExp(lastName.toLowerCase())) ? true : false;
      });
    }
    if (email) {
      users = users.filter(function(user) {
        return user.email.toLowerCase().match(new RegExp(email.toLowerCase())) ? true : false;
      });
    }

    // Set new working set based on filters
    this.setState({users: users});
  },

  handleReset: function(e) {
    // Reset form fields
    this.state.s_fname = '';
    this.state.s_lname = '';
    this.state.s_email = '';

    // Reset working set to (initial) cached data set
    this.setState({users: this.state.data});
  },

  handleSortClick: function(column) {
    var prev = this.state.sort_by
    this.setState({sort_by: column});

    // Toggle order if the user clicked the same column twice
    if (prev == this.state.sort_by) {
      if (this.state.order == "DESC") {
        this.setState({order: "ASC"});
      } else if (this.state.order == "ASC") {
        this.setState({order: "DESC"});
      }
    } else {
      this.setState({order: "DESC"});
    }

    // Retrieve current working set
    var users = this.state.users;

    // Sort users based on order
    if (this.state.order == "DESC") {
      users = users.sort(function (a, b) {
        if(a[column] < b[column]) return -1;
        if(a[column] > b[column]) return 1;
        return 0;
      });
    } else if (this.state.order == "ASC") {
      users = users.sort(function (a, b) {
        if(a[column] > b[column]) return -1;
        if(a[column] < b[column]) return 1;
        return 0;
      });
    }

    // Reassign current working set (with new order)
    this.setState({users: users});
  },

  componentWillMount: function() {
    if (!sessionStorage.getItem('id')) {
      this.render = function() {
        return false;
      }
    }
  },

  componentDidMount: function() {
    this.setState({data: this.props.data, users: this.props.data});
  },

  render: function() {
    return (
      <div className="row">
          <UserSearch
            handleSearch={this.handleSearch}
            handleReset={this.handleReset}
          />
          <br/>
          <UserTable
            order={this.state.order}
            sort_by={this.state.sort_by}
            data={this.state.users}
            handleClick={this.handleSortClick}
          />
      </div>
    );
  }
});
