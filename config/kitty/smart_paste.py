TEXT_TYPES = {"text/plain", "text/plain;charset=utf-8", "UTF8_STRING", "STRING", "TEXT"}


def main(args):
    return None


from kittens.tui.handler import result_handler


@result_handler(no_ui=True)
def handle_result(args, answer, target_window_id, boss):
    w = boss.window_id_map.get(target_window_id)
    if w is None:
        return

    mime_types = set(boss.clipboard.get_available_mime_types_for_paste())

    if mime_types & TEXT_TYPES:
        text = boss.clipboard.get_text()
        if text:
            w.paste_with_actions(text)
    elif any(m.startswith("image/") for m in mime_types):
        w.write_to_child("\x16")
