var UserPagination = React.createClass({
  render: function() {
    var page_id = '',
        page = 1,
        userPages = [];
    for (i=0; i < this.props.count; i+=5) {
      page_id = "users_pagination_"+page;
      userPages.push(
        <li id={page_id} className={(i == 0) ? 'active' : ''} value={i} key={i}><a href="#" onClick={this.props.handleClick.bind(null, i, page_id)}>{page}</a></li>
      );
      page += 1;
    }
    return (
      <div className="row">
        <div className="text-center">
          <nav>
            <ul id="users_pagination" className="pagination">
              {userPages}
            </ul>
          </nav>
        </div>
      </div>
    );
  }
});
