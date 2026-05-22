.class Lcom/taomee/android/crashlog/UploadCrashInfo$1;
.super Ljava/lang/Thread;
.source "UploadCrashInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/taomee/android/crashlog/UploadCrashInfo;->upload(Landroid/content/Context;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/taomee/android/crashlog/UploadCrashInfo;

.field private final synthetic val$params:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/taomee/android/crashlog/UploadCrashInfo;Ljava/util/Map;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/taomee/android/crashlog/UploadCrashInfo$1;->this$0:Lcom/taomee/android/crashlog/UploadCrashInfo;

    iput-object p2, p0, Lcom/taomee/android/crashlog/UploadCrashInfo$1;->val$params:Ljava/util/Map;

    .line 79
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 83
    :try_start_0
    iget-object v0, p0, Lcom/taomee/android/crashlog/UploadCrashInfo$1;->this$0:Lcom/taomee/android/crashlog/UploadCrashInfo;

    iget-object v1, p0, Lcom/taomee/android/crashlog/UploadCrashInfo$1;->val$params:Ljava/util/Map;

    iget-object v2, p0, Lcom/taomee/android/crashlog/UploadCrashInfo$1;->this$0:Lcom/taomee/android/crashlog/UploadCrashInfo;

    invoke-static {v2}, Lcom/taomee/android/crashlog/UploadCrashInfo;->access$0(Lcom/taomee/android/crashlog/UploadCrashInfo;)Ljava/io/File;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/taomee/android/crashlog/UploadCrashInfo;->access$1(Lcom/taomee/android/crashlog/UploadCrashInfo;Ljava/util/Map;Ljava/io/File;)Ljava/lang/String;

    .line 84
    iget-object v0, p0, Lcom/taomee/android/crashlog/UploadCrashInfo$1;->this$0:Lcom/taomee/android/crashlog/UploadCrashInfo;

    invoke-static {v0}, Lcom/taomee/android/crashlog/UploadCrashInfo;->access$0(Lcom/taomee/android/crashlog/UploadCrashInfo;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    :goto_0
    return-void

    .line 85
    :catch_0
    move-exception v0

    goto :goto_0
.end method
