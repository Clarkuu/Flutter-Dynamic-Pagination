A simple dynamic pagination in Flutter.

This takes, the data size, required page size, color and returns the necessary buttons and arrows for pagination.

There is room for improvement.  Pull requests welcome.

Each button press will return a callback function which can be handled in your application. 

Example usage:

Pagination(
    pageSize: pageSize,
    postNumber: numberofPosts,
    onPressed: handlePress,
);

| Parameter | Type   | Required | Description                             |
|-----------|--------|----------|-----------------------------------------|
| pageSize  | int    | Yes      | The number of items per page.           |
| postNumber| int    | Yes      | The total amount of items                |
| onPressed | Function(int) | Yes      | A callback function which returns an integer of the pressed number |
| color       | Color  | No       | The color for page buttons and arrows.  |

