.class public Lcom/taomee/android/pay/HttpClient$HttpResponseHandler;
.super Lcom/loopj/android/http/AsyncHttpResponseHandler;
.source "HttpClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/taomee/android/pay/HttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HttpResponseHandler"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;-><init>()V

    return-void
.end method
