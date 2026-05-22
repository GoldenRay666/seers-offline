.class public abstract Lcom/tendcloud/tenddata/game/aq;
.super Ljava/lang/Object;


# static fields
.field private static final a:Ljava/lang/String; = "eventID"

.field private static final b:Ljava/lang/String; = "eventOccurTime"

.field public static final e:Ljava/lang/String; = "eventData"


# instance fields
.field private c:Ljava/lang/String;

.field private d:J

.field private f:Ljava/util/Map;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/tendcloud/tenddata/game/aq;->c:Ljava/lang/String;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/tendcloud/tenddata/game/aq;->d:J

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/tendcloud/tenddata/game/aq;->f:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method protected a(Ljava/lang/String;Ljava/lang/Object;)Lcom/tendcloud/tenddata/game/aq;
    .locals 1

    iget-object v0, p0, Lcom/tendcloud/tenddata/game/aq;->f:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method protected abstract a()V
.end method

.method protected a_()Lorg/json/JSONObject;
    .locals 2

    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/tendcloud/tenddata/game/aq;->f:Ljava/util/Map;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public c()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public d()Ljava/lang/String;
    .locals 4

    invoke-virtual {p0}, Lcom/tendcloud/tenddata/game/aq;->a()V

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "eventID"

    iget-object v2, p0, Lcom/tendcloud/tenddata/game/aq;->c:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "eventOccurTime"

    iget-wide v2, p0, Lcom/tendcloud/tenddata/game/aq;->d:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v1, "eventData"

    invoke-virtual {p0}, Lcom/tendcloud/tenddata/game/aq;->a_()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    goto :goto_0
.end method
