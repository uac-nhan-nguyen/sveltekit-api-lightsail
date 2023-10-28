/** @type {import('./$types').RequestHandler} */
export function GET() {
  const ans = {
    message: "pong"
  }

  return new Response(JSON.stringify(ans), {
    headers: {
      "content-type": "application/json;charset=UTF-8"
    }
  })
}