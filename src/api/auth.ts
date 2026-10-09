export async function register(req, res) {
  try {
    console.log(req.body);
    const user = await authService.register(req.body);
    return res.status(201).json({ user_id: user.id });
  } catch (err) {
    return res.status(400).json({ error: { code: err.code, message: err.message } });
  }
}
