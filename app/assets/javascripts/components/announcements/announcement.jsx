var Announcement = React.createClass({
  render: function() {
    var announcementNodes = this.props.data.map(function (ann) {
      return (
        <p key={ann.id}>{ann.announcement}</p>
      );
    });
    return (
      <div className="announcement">
        {announcementNodes}
      </div>
    );
  }
});
