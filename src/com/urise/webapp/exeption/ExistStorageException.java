package com.urise.webapp.exeption;

public class ExistStorageException extends StorageException {
    public ExistStorageException(String uuid) {
        super("Резюме " + uuid + " уже создано!!!", uuid);
    }
}
