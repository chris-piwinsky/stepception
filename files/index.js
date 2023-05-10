exports.handler = async (event) => {
  console.log("Event:", JSON.stringify(event, null, 2));
  let body = "You are calling: " + process.env.HELLOWORLD
  const response = {
      statusCode: 200,
      body: body
  };
  return response;
};
