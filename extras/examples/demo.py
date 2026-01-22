"""Cursor Dark Theme - Python Demo"""

from dataclasses import dataclass
from typing import Optional
import asyncio

API_URL = "https://api.example.com"


@dataclass
class User:
    id: int
    name: str
    email: Optional[str] = None

    def greet(self) -> str:
        return f"Hello, {self.name}!"


async def fetch_users(limit: int = 10) -> list[User]:
    """Fetch users from the API."""
    users = []

    for i in range(limit):
        await asyncio.sleep(0.1)  # Simulated delay
        user = User(id=i, name=f"User {i}")
        users.append(user)

    return users


async def main() -> None:
    users = await fetch_users(limit=5)

    for user in users:
        if user.email is None:
            print(f"Warning: {user.name} has no email")
        else:
            print(user.greet())


if __name__ == "__main__":
    asyncio.run(main())
