import subprocess


def main(args):
    return None


from kittens.tui.handler import result_handler

TEXT_TYPES = {"text/plain", "text/plain;charset=utf-8", "UTF8_STRING", "STRING", "TEXT"}


@result_handler(no_ui=True)
def handle_result(args, answer, target_window_id, boss):
    w = boss.window_id_map.get(target_window_id)
    if w is None:
        return

    r = subprocess.run(["wl-paste", "--list-types"], capture_output=True, timeout=2)
    if r.returncode != 0:
        return

    mime_types = {m.strip() for m in r.stdout.decode("utf-8", errors="replace").splitlines()}

    if mime_types & TEXT_TYPES:
        r = subprocess.run(["wl-paste", "--no-newline"], capture_output=True, timeout=2)
        if r.returncode == 0 and r.stdout:
            w.write_to_child(r.stdout.decode("utf-8", errors="replace"))
    elif any(m.startswith("image/") for m in mime_types):
        w.write_to_child("\x16")
