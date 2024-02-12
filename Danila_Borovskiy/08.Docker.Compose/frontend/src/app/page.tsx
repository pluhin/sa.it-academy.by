export const dynamic = "force-dynamic";

const getDateFromBackend = async (): Promise<string> => {
  const response = await fetch('http://backend:8080/date');

  return JSON.parse(await response.text());
}

export default async function Home() {
  const date = await getDateFromBackend()

  return (
    <main className="flex min-h-screen items-center justify-center bg-gradient-to-br from-blue-300 to-blue-700">
      <div className="text-center text-white">
        <h1 className="text-4xl font-bold mb-8">Current date from DB</h1>
        <p className="text-lg mb-4">
          {new Date(date).toLocaleDateString()}
        </p>
      </div>
    </main>
  );
}
