var UserBox = React.createClass({

  getInitialState: function() {
    return {
      data: [],
      users: [],
      count: 0,
      url: 'http://localhost:3000/api/user',
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
    this.setState({
      users: users,
      count: users.count
    });
  },

  handleReset: function(e) {
    // Reset form fields
    this.state.s_fname = '';
    this.state.s_lname = '';
    this.state.s_email = '';

    // Reset working set to (initial) cached data set
    this.setState({
      users: this.state.data,
      count: this.state.data.count
    });
  },

  handleSortClick: function(column) {
    // Shuffle sort_by and prev_sort_by
    this.setState({
      prev_sort_by: this.state.sort_by,
      sort_by: column
    });

    // Toggle order if the user clicked the same column twice 
    if (this.state.prev_sort_by == this.state.sort_by) {
      if (this.state.order == "DESC") {
        this.setState({order: "ASC"});
      } else if (this.state.order == "ASC") {
        this.setState({order: "DESC"});
      }
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
    var data = {
      s_fname: this.state.s_fname,
      s_lname: this.state.s_lname,
      s_email: this.state.s_email
    };

    $.ajax({
      url: this.state.url,
      dataType: 'json',
      data: data,
      cache: false,

      beforeSend: function(req) {
        req.setRequestHeader("Authorization", sessionStorage.getItem('authentication'));
      },

      success: function(data) {
        this.setState({
          data: data.user,
          users: data.user,
          count: data.meta.count
        });
        $("#loading_users_spinner").addClass('hide');
      }.bind(this),

      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },

  render: function() {
    return (
      <div className="userBox">
        <div className="row">
          <div className=".col-lg-3 .col-lg-offset-3 .col-md-3 .col-md-offset-3 .col-sm-3 .col-sm-offset-3">
            <h1>
              Profiles <span style={{color:"#337ab7"}}><i id="loading_users_spinner" className="fa fa-spinner fa-pulse"></i></span>
              <br/>
              <small>Click on the view link next to the person's name to view the route in more detail.</small>
            </h1>
            <hr/>
          </div>
        </div>
        <div className="row">
          <div className=".col-lg-3 .col-lg-offset-3 .col-md-3 .col-md-offset-3 .col-sm-3 .col-sm-offset-3">
            <UserSearch handleSearch={this.handleSearch} handleReset={this.handleReset}/>
            <br/>
            <UserList data={this.state.users} handleClick={this.handleSortClick}/>
          </div>
        </div>
      </div>
    );
  }
});
