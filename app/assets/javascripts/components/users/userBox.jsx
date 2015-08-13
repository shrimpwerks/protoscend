var UserBox = React.createClass({
  loadUsersFromServer: function() {
    console.log(this.state.url);
    $.ajax({
      url: this.state.url,
      beforeSend: function(req) {
        req.setRequestHeader("Authorization", sessionStorage.getItem('authentication'));
      },
      dataType: 'json',
      cache: false,
      success: function(data) {
        this.setState({
          data: data.user,
          count: data.meta.count
        });
        $("#loading_users_spinner").addClass('hide');
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  getInitialState: function() {
    return {
      data: [],
      count: 0,
      url: 'http://localhost:3000/api/user',
      s_fname: '',
      s_lname: '',
      s_email: '',
      sort_by: '',
      prev_sort_by: 'null',
      order: 'ASC',
      offset: 0
    };
  },
  formatURL: function() {
    var url ='http://localhost:3000/api/user?'

    if (this.state.offset !== 0) {
      url = url + 'offset=' + this.state.offset + '&';
    }
    if (this.state.s_fname !== '') {
      url = url + 's_fname=' + this.state.s_fname + '&'
    }
    if (this.state.s_lname !== '') {
      url = url + 's_lname=' + this.state.s_lname + '&'
    }
    if (this.state.s_email !== '') {
      url = url + 's_email=' + this.state.s_email + '&'
    }
    if (this.state.sort_by !== '') {
      if (this.state.sort_by === this.state.prev_sort_by) {
        if (this.state.order === 'ASC') {
          this.state.order = 'DESC';
        } else {
          this.state.order = 'ASC';
        }
      }
      url = url + 'sort_by=' + this.state.sort_by + '&order_by=' + this.state.order;
    }
    this.state.url = url;
  },
  handleSearch: function(s) {
    this.state.s_fname = s.fname;
    this.state.s_lname = s.lname;
    this.state.s_email = s.email;
    this.formatURL();
    this.loadUsersFromServer();
  },
  handleReset: function(e) {
    this.state.s_fname = '';
    this.state.s_lname = '';
    this.state.s_email = '';
    this.formatURL();
    this.loadUsersFromServer();
  },
  handlePageClick: function(offset, page_id) {
    // highlight current page
    $("#users_pagination").find('li').each(function() {
      $(this).removeClass('active');
    });
    $("#"+page_id).addClass('active')

    // fetch correct page data
    this.state.offset = offset;
    this.formatURL();
    this.loadUsersFromServer();
  },
  handleSortClick: function(val) {
    this.state.sort_by = val;
    this.state.prev_sort_by = this.state.sort_by;
    this.formatURL();
    this.state.prev_sort_by = 'null'
    this.loadUsersFromServer();
  },
  componentWillMount: function() {
    if (!sessionStorage.getItem('id')) {
      this.render = function() {
        return false;
      }
    }
  },
  componentDidMount: function() {
    this.loadUsersFromServer();
    // do this if we want live polling, but really that's pretty taxing form
    // no reason.
    // setInterval(this.loadUsersFromServer, this.props.pollInterval);
  },
  render: function() {
    return (
      <div className="userBox">
        <div className="row">
          <div className=".col-lg-3 .col-lg-offset-3 .col-md-3 .col-md-offset-3 .col-sm-3 .col-sm-offset-3">
          <UserSearch handleSearch={this.handleSearch} handleReset={this.handleReset}/>
            <br/>
            <table className="table">
              <UserList data={this.state.data} handleClick={this.handleSortClick}/>
            </table>
          </div>
        </div>
        <UserPagination count={this.state.count} handleClick={this.handlePageClick}/>
      </div>
    );
  }
});
