import {API_KEY} from "$lib/server/secrets.js";

/**
 *  @type {import('@sveltejs/kit').Handle}
 *  @param {import('@sveltejs/kit').RequestEvent} event
 *  */
export async function handle({event, resolve}) {
  if (event.url.pathname.startsWith('/api')) {
    const apiKey = event.request.headers.get('api-key')

    if (apiKey !== API_KEY) {
      return new Response('Unauthorized', {status: 401})
    }
  }

  const response = await resolve(event);
  return response;
}