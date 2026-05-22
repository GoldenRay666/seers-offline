.class public Lcom/taomee/android/pay/APKHelper;
.super Ljava/lang/Object;
.source "APKHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static chmod(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .param p0, "permission"    # Ljava/lang/String;
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 20
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "chmod "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 21
    .local v0, "command":Ljava/lang/String;
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v2

    .line 22
    .local v2, "runtime":Ljava/lang/Runtime;
    invoke-virtual {v2, v0}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    const/4 v3, 0x1

    .line 29
    .end local v0    # "command":Ljava/lang/String;
    .end local v2    # "runtime":Ljava/lang/Runtime;
    :goto_0
    return v3

    .line 25
    :catch_0
    move-exception v1

    .line 27
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 29
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public static copyAssetToFolder(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 12
    .param p0, "contex"    # Landroid/content/Context;
    .param p1, "fileName"    # Ljava/lang/String;
    .param p2, "folderName"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x0

    .line 57
    const/4 v7, 0x0

    .line 58
    .local v7, "is":Ljava/io/InputStream;
    const/4 v5, 0x0

    .line 59
    .local v5, "fos":Ljava/io/FileOutputStream;
    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    .line 60
    .local v0, "am":Landroid/content/res/AssetManager;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v11, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 64
    .local v4, "filePath":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v7

    .line 65
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 66
    .local v3, "f":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_0

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 67
    :cond_0
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z

    .line 68
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_7
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .local v6, "fos":Ljava/io/FileOutputStream;
    const/4 v8, 0x0

    .line 71
    .local v8, "length":I
    const/16 v10, 0x400

    :try_start_1
    new-array v1, v10, [B

    .line 72
    .local v1, "buff":[B
    :goto_0
    invoke-virtual {v7, v1}, Ljava/io/InputStream;->read([B)I

    move-result v8

    if-gtz v8, :cond_4

    .line 74
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->flush()V

    .line 75
    invoke-virtual {v3}, Ljava/io/File;->exists()Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v9

    .line 83
    if-eqz v7, :cond_1

    .line 85
    :try_start_2
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 87
    :cond_1
    :goto_1
    if-eqz v6, :cond_2

    .line 89
    :try_start_3
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    :cond_2
    :goto_2
    move-object v5, v6

    .line 92
    .end local v1    # "buff":[B
    .end local v3    # "f":Ljava/io/File;
    .end local v6    # "fos":Ljava/io/FileOutputStream;
    .end local v8    # "length":I
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    :cond_3
    :goto_3
    return v9

    .line 73
    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v1    # "buff":[B
    .restart local v3    # "f":Ljava/io/File;
    .restart local v6    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "length":I
    :cond_4
    const/4 v10, 0x0

    :try_start_4
    invoke-virtual {v6, v1, v10, v8}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_0

    .line 77
    .end local v1    # "buff":[B
    :catch_0
    move-exception v2

    move-object v5, v6

    .line 79
    .end local v3    # "f":Ljava/io/File;
    .end local v6    # "fos":Ljava/io/FileOutputStream;
    .end local v8    # "length":I
    .local v2, "e":Ljava/io/IOException;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    :goto_4
    :try_start_5
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 83
    if-eqz v7, :cond_5

    .line 85
    :try_start_6
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 87
    :cond_5
    :goto_5
    if-eqz v5, :cond_3

    .line 89
    :try_start_7
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1

    goto :goto_3

    :catch_1
    move-exception v10

    goto :goto_3

    .line 82
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v9

    .line 83
    :goto_6
    if-eqz v7, :cond_6

    .line 85
    :try_start_8
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    .line 87
    :cond_6
    :goto_7
    if-eqz v5, :cond_7

    .line 89
    :try_start_9
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_6

    .line 91
    :cond_7
    :goto_8
    throw v9

    .line 85
    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v1    # "buff":[B
    .restart local v3    # "f":Ljava/io/File;
    .restart local v6    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "length":I
    :catch_2
    move-exception v10

    goto :goto_1

    .line 89
    :catch_3
    move-exception v10

    goto :goto_2

    .line 85
    .end local v1    # "buff":[B
    .end local v3    # "f":Ljava/io/File;
    .end local v6    # "fos":Ljava/io/FileOutputStream;
    .end local v8    # "length":I
    .restart local v2    # "e":Ljava/io/IOException;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    :catch_4
    move-exception v10

    goto :goto_5

    .end local v2    # "e":Ljava/io/IOException;
    :catch_5
    move-exception v10

    goto :goto_7

    .line 89
    :catch_6
    move-exception v10

    goto :goto_8

    .line 82
    .end local v5    # "fos":Ljava/io/FileOutputStream;
    .restart local v3    # "f":Ljava/io/File;
    .restart local v6    # "fos":Ljava/io/FileOutputStream;
    .restart local v8    # "length":I
    :catchall_1
    move-exception v9

    move-object v5, v6

    .end local v6    # "fos":Ljava/io/FileOutputStream;
    .restart local v5    # "fos":Ljava/io/FileOutputStream;
    goto :goto_6

    .line 77
    .end local v3    # "f":Ljava/io/File;
    .end local v8    # "length":I
    :catch_7
    move-exception v2

    goto :goto_4
.end method

.method public static getAPKVersion(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "filePath"    # Ljava/lang/String;

    .prologue
    .line 48
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 50
    .local v1, "pm":Landroid/content/pm/PackageManager;
    const/16 v2, 0x80

    .line 49
    invoke-virtual {v1, p1, v2}, Landroid/content/pm/PackageManager;->getPackageArchiveInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 51
    .local v0, "info":Landroid/content/pm/PackageInfo;
    iget-object v2, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    return-object v2
.end method

.method public static isPackageExists(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 34
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    .line 35
    .local v4, "pm":Landroid/content/pm/PackageManager;
    invoke-virtual {v4, v5}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object v3

    .line 36
    .local v3, "list":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/PackageInfo;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    .line 37
    .local v2, "length":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, v2, :cond_0

    .line 43
    :goto_1
    return v5

    .line 39
    :cond_0
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/PackageInfo;

    .line 40
    .local v1, "info":Landroid/content/pm/PackageInfo;
    iget-object v6, v1, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v6, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 41
    const/4 v5, 0x1

    goto :goto_1

    .line 37
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method
