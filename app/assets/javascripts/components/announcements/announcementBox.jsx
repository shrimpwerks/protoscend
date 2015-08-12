var AnnouncementBox = React.createClass({
  loadAnnouncementFromServer: function() {
    $.ajax({
      url: this.props.url,
      dataType: 'json',
      cache: false,
      success: function(data) {
        $("#loading_announcements_spinner").addClass('hide');
        this.setState({data: data});
      }.bind(this),
      error: function(xhr, status, err) {
        console.error(this.props.url, status, err.toString());
      }.bind(this)
    });
  },
  getInitialState: function() {
    return {data: []};
  },
  componentDidMount: function() {
    this.loadAnnouncementFromServer();
    // do this if we want live polling, but really that's pretty taxing form
    // no reason.
    // setInterval(this.loadUsersFromServer, this.props.pollInterval);
  },
  render: function() {
    return (
      <div className="announcementBox">
        <Announcement data={this.state.data} />
        <p><a className="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
      </div>
    );
  }
});
