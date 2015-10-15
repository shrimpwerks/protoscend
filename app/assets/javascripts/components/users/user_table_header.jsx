var UserTableHeader = React.createClass({
  caretClass: function() {
    var classes = [];

    // Show or hide the caret
    if (this.props.sort_by !== this.props.column) {
      classes.push("hidden");
    } else {
      // Flip caret direction
      if (this.props.order == "ASC") {
        // Nada
      } else if (this.props.order == "DESC") {
        classes.push("dropup");
      }
    }

    return classes;
  },

  render: function() {
    return (
      <th onClick={this.props.handleClick.bind(null, this.props.column)}>
        {this.props.label}
        <div className={this.caretClass()} style={{ display: "inline-block" }}>
          <span className="caret"></span>
        </div>
      </th>
    );
  }
});
