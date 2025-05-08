import * as functions from "firebase-functions";

export const onNextStep = functions.https.onCall((_data, _context) => {
  console.log("✅ Function called: onNextStep");

  return {message: "Function executed successfully!"};
});
